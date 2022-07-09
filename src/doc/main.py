def define_env(env):

    @env.macro
    def contribution_by(github_username):
        return "<sub>Contribution by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"
        
    @env.macro
    def question_by(github_username):
        return "<sub>Question by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"
        
    @env.macro
    def answer_by(github_username):
        return "<sub>Answer by: [@" + github_username + "](https://github.com/" + github_username + ")<sub>"