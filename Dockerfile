FROM cloud66/cx:latest

LABEL "com.github.actions.name"="Cloud 66 Toolbelt"
LABEL "com.github.actions.description"="GitHub Action that allows you to perform Cloud 66 Toolbelt operations when envoked."
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"
LABEL "repository"="http://github.com/cloud66/github-actions"
LABEL "homepage"="http://github.com/cloud66/github-actions"
LABEL "maintainer"="Cloud66 <https://www.cloud66.com/>"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
