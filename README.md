# SonarQube Scan GitHub Action 1.0.1

The `github-action-devops-sonar-scan` Github Action will scan your code with SonarQube to detects bugs, vulnerabilities and code smells.

## Inputs

| Name | Description | Required |Default |
| --- | --- | --- | --- |
| `host` | Cepsa TD SonarQube server URL | :heavy_check_mark: | |
| `login` | SonarQube username | :heavy_check_mark: | |
| `password` | SonarQube password | :heavy_check_mark: | |
| `projectBaseDir` | sonar.projectBaseDir: Property to move analysis to a different directory | | "." |
<!--| `checkQualityGate` | Flag to stop the workflow if sonar quality gate not passed | | "true" | -->

## Requirements

* `sonar-project.properties` file must exist in the root of the project. ([example](https://cloudfirst.cepsacorp.com/books/buenas-pr%C3%A1cticas/page/testing-en-python#bkmrk-configurando-nuestro))
* Dependency with [`cepsadigital/github-action-devops-test-and-code-analysis`](https://github.com/cepsadigital/github-action-devops-test-and-code-analysis) Action, which generates the coverage and security (bandit) reports in a previous step.

## Usage

```yaml
on:
  workflow_dispatch:
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: SonarQube Scan
      uses: cepsadigital/github-action-devops-sonar-scan@1.0.0
      with:
        host: ${{ secrets.TD_SONAR_HOST }}
        login: ${{ secrets.TD_SONAR_USER }}
        password: ${{ secrets.TD_SONAR_PSW }} 
```

## Secrets

- `TD_SONAR_HOST` - **_(Required)_** this is the Cepsa TD SonarQube server URL.
- `TD_SONAR_USER` - **_(Required)_** this is the SonarQube username.
- `TD_SONAR_PSW` - **_(Required)_** this is the SonarQube password.

## Contact

DevOps Team - [Devops Documentation Portal](https://doc.devops.cepsacorp.com/) - devops@cepsa.com

More GitHub Actions in Cepsa TD: [https://github.com/cepsadigital?q=github-action-&type=&language=&sort=](https://github.com/cepsadigital?q=github-action-&type=&language=&sort=)
