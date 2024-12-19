// see https://github.com/EclipseFdn/otterdog-defaults/blob/main/otterdog-defaults.libsonnet
local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

// see https://otterdog.readthedocs.io/en/latest/reference/organization/
orgs.newOrg('eclipse-lsp4e') {
  settings+: {
    description: "",
    name: "Eclipse LSP4E",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/lsp4e/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('lsp4e') {
      allow_merge_commit: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Language Server Protocol support in Eclipse IDE",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://projects.eclipse.org/projects/technology.lsp4e",
      squash_merge_commit_message: "PR_BODY",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "eclipse",
        "eclipse-plugin",
        "java",
        "language-server-protocol",
        "lsp"
      ],
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
