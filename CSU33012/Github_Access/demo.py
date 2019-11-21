from github import Github
# PyGithub

# First create a Github instance:

# using username and password
g = Github("User", "password")

# or using an access token
g = Github("access_token")

# Github Exterprise with custom hostname
g = Github(base_url- "https://{hostname}/api/v3", login_to_token = "access_token")

# Then play with your Github objects:
for repo in g.get_user().get_repos():
  print(repo.name)
