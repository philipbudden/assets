# Assets

Data files for use in portfolio projects.

These are derived from the AdventureWorks 2022 OLTP dataset.

## Usage

> [!NOTE]
> If using an M-Series Mac, add `--platform linux/amd64` to the parameters and ensure you are using Rosetta 2 emulation.
> For example:
> `docker run --platform linux/amd64 -p 1433:1433 -d ghcr.io/philipbudden/assets/mssql-purchasing:latest`

### mssql-purchasing
```shell
docker run -p 1433:1433 -d ghcr.io/philipbudden/assets/mssql-purchasing:latest
```

### sftp-human-resources
```shell
docker run -p 2222:22 -d ghcr.io/philipbudden/assets/sftp-human-resources testuser:testpass:::upload
```

## Validate

Workflows can be validated using the GitHub CLI extension, act.

```shell
gh act workflow_dispatch --job $JOBID
```

A list of job ID's can be found by running:
```shell
gh act --list
```

> [!NOTE]
> If using an M-Series Mac, add `--container-architecture linux/amd64` to the parameters and ensure you are using Rosetta 2 emulation.
> For example:
> `gh act workflow_dispatch --job sftp-build --container-architecture linux/amd64`

