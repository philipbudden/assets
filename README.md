# Assets

This repository provides data assets for use in portfolio projects.  

All datasets are derived from the **AdventureWorks 2022 OLTP** sample database.

---

## Usage

> [!NOTE]  
> On Apple Silicon (M-Series) Macs, you must run containers under Rosetta 2 emulation.  
> Add `--platform linux/amd64` to your Docker parameters.  
> Example:  
> ```shell
> docker run --platform linux/amd64 -p 1433:1433 -d ghcr.io/philipbudden/assets/mssql-purchasing:latest
> ```

### Available Containers

#### MSSQL – Purchasing
```shell
docker run -p 1433:1433 -d ghcr.io/philipbudden/assets/mssql-purchasing:latest
```

#### SFTP – Human Resources
```shell
docker run -p 2222:22 -d ghcr.io/philipbudden/assets/sftp-human-resources:latest testuser:testpass:::upload
```

#### Object Storage – Person
```shell
docker run -p 10000:10000 -d ghcr.io/philipbudden/assets/object-person:latest
```

## Workflow Validation
Workflows can be tested locally using the GitHub CLI extension act.

Dispatch a workflow job:
```shell
gh act workflow_dispatch --job $JOBID
```
List available job IDs:
```shell
gh act --list
```

> [!NOTE]  
> On Apple Silicon (M-Series) Macs, include the `--container-architecture linux/amd64` flag when running act.  
> Example:
> ```shell
> gh act workflow_dispatch --job sftp-build --container-architecture linux/amd64
> ```

