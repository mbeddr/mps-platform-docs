import re

from levenshtein import levenshtein

def count(str1, str2): 
    c, j = 0, 0
    for i in str1:    
        if str2.find(i)>= 0 and j == str1.find(i): 
            c += 1
        j += 1
    return c
    
def define_env(env):

    dictOfStrings = {
        '@openapi':'com.intellij.openapi',
        '@mps': 'jetbrains.mps',
        '@baselang' : 'jetbrains.mps.baseLanguage',
        '@mpsutil' : 'com.mbeddr.mpsutil',
        '@itemis' : 'de.itemis',
        '@mbeddr': 'com.mbeddr.core',
        '@iets3' : 'org.iets3.core'
    }


    url_mappings = {}
    identifier_mapping = {}
    with open("mappings.txt") as myfile:
        for line in myfile:
            name, var = line.partition("=")[::2]
            identifier = name.strip()
            identifier_short = identifier.rsplit('.', 1)[1]
            url_mappings[identifier] = var
            if identifier_short in identifier_mapping:
                identifier_mapping[identifier_short].append(identifier)
            else:
                identifier_mapping[identifier_short] = [identifier]

    @env.macro
    def contribution_by(github_username):
        return "<sub>Contribution by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"
        
    @env.macro
    def question_by(github_username):
        return "<sub>Question by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"
        
    @env.macro
    def answer_by(github_username):
        return "<sub>Answer by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"
        
    @env.macro
    def mps_url(identifier):

        for word, replacement in dictOfStrings.items():
            identifier = re.sub(word, replacement, identifier)
        identifier_short = (identifier.rsplit('.', 1)[1]) if identifier.index(".") != -1 else identifier
        possible_identifiers = identifier_mapping[identifier_short] 
        if len(possible_identifiers) == 0:
            raise Exception("Couldn't find matching short identifier for " + identifier)
        matching_identifier = min(possible_identifiers, key=lambda x: levenshtein(identifier,x) - 5 * count(identifier, x)) 
        url = url_mappings[matching_identifier].strip()
        return "[" + identifier_short + "](http://127.0.0.1:63320/node?ref=" + url + ")"
        
    @env.macro
    def image_popup(link, text, image_path, alt_text):
        return '<span class="hover_img"><a href="' + link + '">' + text + '<span><img src="' + image_path + '" alt="' + alt_text + '" /></span></a></span>'