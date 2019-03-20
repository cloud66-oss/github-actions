workflow "New workflow" {
  on = "push"
  resolves = ["cloud66"]
}

action "cloud66" {
  uses = "./.cloud66/cx"
}

