workflow "Build unity3d workflow" {
  on = "push"
  resolves = ["Build unity3d"]
}

action "Build unity3d" {
  uses = "docker://gableroux/unity3d:2019.1.14f1"
  runs = "./ci/before_script.sh && ./ci/build.sh"
}

workflow "Get license workflow" {
  on = "deployment"
  resolves = ["Get license"]
}

action "Get license" {
  uses = "docker://gableroux/unity3d:2019.1.14f1"
  runs = "./ci/get_license.sh"
}
