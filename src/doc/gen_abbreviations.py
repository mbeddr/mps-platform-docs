import mkdocs_gen_files
import re

abbreviations_file = f"reference/abbreviations.md"
abbreviations_inc_file = f"includes/abbreviations.md"

abbr_pattern = re.compile(r'\*\[(.*)\]:\s*(.*)')

with mkdocs_gen_files.open(abbreviations_file, "w+") as f:
    print("#Abbreviations", file=f)
    
    for i, line in enumerate(mkdocs_gen_files.open(abbreviations_inc_file,"r")):
        for match in re.finditer(abbr_pattern, line):
            print("**" + match.group(1) + "**: " + match.group(2) + "\n", file=f)

mkdocs_gen_files.set_edit_path(abbreviations_file, "gen_abbreviations.py")