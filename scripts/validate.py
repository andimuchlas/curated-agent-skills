#!/usr/bin/env python3
import os
import sys
import re

def validate_frontmatter(content, filepath):
    if not content.startswith("---"):
        return False, "Missing opening YAML frontmatter delimiter (---)"
    parts = content.split("---", 2)
    if len(parts) < 3:
        return False, "Missing closing YAML frontmatter delimiter (---)"
    fm = parts[1]
    has_name = bool(re.search(r"^name:\s*[\w\.\-]+", fm, re.MULTILINE))
    has_desc = bool(re.search(r"^description:\s*", fm, re.MULTILINE))
    if not has_name:
        return False, "Frontmatter missing 'name:' field"
    if not has_desc:
        return False, "Frontmatter missing 'description:' field"
    return True, ""

def main():
    root_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    skills_dir = os.path.join(root_dir, "skills")

    print(f"Validating skills in: {skills_dir}")
    if not os.path.exists(skills_dir):
        print(f"Error: skills directory not found at {skills_dir}")
        sys.exit(1)

    errors = []
    skill_count = 0
    file_count = 0

    max_file_size = 1.5 * 1024 * 1024  # 1.5 MB limit per file

    for super_skill in os.listdir(skills_dir):
        super_path = os.path.join(skills_dir, super_skill)
        if not os.path.isdir(super_path):
            continue

        skill_count += 1
        master_skill_md = os.path.join(super_path, "SKILL.md")
        if not os.path.exists(master_skill_md):
            errors.append(f"Missing master SKILL.md in: {super_skill}")
        else:
            with open(master_skill_md, "r", encoding="utf-8") as f:
                valid, msg = validate_frontmatter(f.read(), master_skill_md)
                if not valid:
                    errors.append(f"Invalid frontmatter in {super_skill}/SKILL.md: {msg}")

        # Scan all files inside super_skill
        for root, dirs, files in os.walk(super_path):
            for file in files:
                file_count += 1
                fp = os.path.join(root, file)
                rel_path = os.path.relpath(fp, root_dir)

                # Check file size
                sz = os.path.getsize(fp)
                if sz > max_file_size:
                    errors.append(f"File exceeds 1.5 MB limit ({sz / (1024*1024):.2f} MB): {rel_path}")

                # Check markdown files for broken demo/ links
                if file.endswith(".md"):
                    with open(fp, "r", encoding="utf-8", errors="ignore") as f:
                        text = f.read()
                        if "demo/index.html" in text or "demo/build.mjs" in text:
                            errors.append(f"Dangling demo link found in: {rel_path}")

    print(f"Checked {skill_count} super-skills ({file_count} total files).")

    if errors:
        print(f"FAILED: Found {len(errors)} validation error(s):")
        for err in errors:
            print(f"  - {err}")
        sys.exit(1)

    print("SUCCESS: All skills passed validation.")
    sys.exit(0)

if __name__ == "__main__":
    main()
