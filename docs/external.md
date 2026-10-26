# External Resources

## Choosing a computing resource

The following are recommended starting points for additional research computing:

| Resource | Recommended use | Starting allocation |
| --- | --- | --- |
| [Jetstream2](https://www.jetstream-cloud.org/get-started/index.html) through ACCESS | A virtual machine where you control the operating system and software environment, including GPU computing. | Apply for Explore ACCESS, then exchange credits for Jetstream2 resources. |
| [Alpine at CU Boulder](https://www.colorado.edu/partnerships/rmacc/sharedresources) through RMACC | A managed cluster with Slurm, installed software, and browser-based Jupyter sessions. | RMACC users receive a Trailhead allocation automatically when their Research Computing account is created. |

Both routes use an ACCESS account, but their allocation processes are separate. An allocation gives permission and a usage budget or share of a system. Starting a GPU session also depends on available hardware and, on Alpine, the job queue.

## Jetstream2 through Explore ACCESS

[ACCESS](https://allocations.access-ci.org/) provides computing resources at no monetary cost for eligible research and education. An NSF grant is not required. **Explore ACCESS** is a starting allocation for evaluating resources, developing and testing software, benchmarking, and smaller research or teaching projects.

Requests are accepted anytime. The current Explore limit is **400,000 ACCESS credits**, issued in two stages: half initially, with the remainder available after a progress report. Credits track permitted resource use; they are not dollar charges. You can upgrade later if your needs grow. See [project types](https://allocations.access-ci.org/project-types) and [credit rules](https://allocations.access-ci.org/exchange_calculator).

### Applying for Explore ACCESS

1. Create an ACCESS account using your institutional email and complete your profile. If you already have an ACCESS or former XSEDE account, use that account.
2. Prepare a short project overview explaining the research or teaching objective, the software you will run, and why you need computing resources.
3. Prepare the project title, keywords, research field, grant details if applicable, and a PDF CV or resume for each project lead, limited to three pages. Graduate-student leads need a signed advisor letter on institutional letterhead, or the specified NSF fellowship documentation. For classroom use, also prepare a course syllabus.
4. In the [allocations portal](https://allocations.access-ci.org/), select **New Project**, choose **Explore ACCESS**, complete the form, and request ACCESS credits.

For a Jetstream2 GPU request, we recommend identifying the software, explaining how it uses GPUs, estimating the GPU memory needed, and describing the initial tests. If performance is unknown, explain that benchmarking will establish the requirements for subsequent work.

Follow the current [application requirements](https://allocations.access-ci.org/prepare-requests) and [first-project guide](https://allocations.access-ci.org/get-your-first-project). Most Explore requests are approved within two business days. Resource approval is a separate step: ACCESS advises allowing up to a week for the credit exchange, and account provisioning can add time. You can submit a request immediately, but should plan ahead for computing access. See [review and exchange instructions](https://allocations.access-ci.org/how-to).

### Getting a GPU virtual machine

After your Explore project is approved:

1. Open the project in the allocations portal and use **Credits + Resources** to request an exchange.
2. Select **Jetstream2 GPU** explicitly. A Jetstream2 CPU allocation does not include GPU access.
3. Request enough service units for your planned usage and explain the GPU requirement. The exchange requires approval by the resource provider.
4. After approval and activation, sign into [Exosphere](https://jetstream2.exosphere.app/) with ACCESS, select your allocation, and choose **Create > Instance**.
5. Choose a supported operating-system image and a GPU size. For one full A100 GPU with 40 GB of GPU memory, the current size is **`g3.xl`**. Smaller GPU sizes provide fractions of a GPU. Launching remains subject to capacity and project quotas.

Follow the [Jetstream2 login instructions](https://docs.jetstream-cloud.org/getting-started/login/) and [instance creation guide](https://docs.jetstream-cloud.org/getting-started/first-instance/). The introductory creation guide uses a CPU size; substitute the GPU size you need from the [current instance sizes](https://docs.jetstream-cloud.org/general/vmsizes/).

For budgeting, `g3.xl` currently consumes **64 service units per running hour**. Thus, 100 hours require **6,400 service units**. Jetstream2 currently exchanges one ACCESS credit for one service unit. Check the current rates before requesting an exchange.

**Save your work and shelve the instance when finished.** An idle running VM continues consuming units, and merely stopping it still incurs a reduced charge. Shelving releases computing resources and stops service-unit charges. It preserves disk contents but ends running programs. See [Jetstream2 accounting](https://docs.jetstream-cloud.org/general/access/) and [instance management](https://docs.jetstream-cloud.org/general/instancemgt/).

## Alpine through RMACC

CU Denver is a member of the [Rocky Mountain Advanced Computing Consortium (RMACC)](https://rmacc.org). Its users can request access to Alpine at CU Boulder through the RMACC route.

### Getting an account and starting allocation

Create an ACCESS account, then follow the **RMACC tab** in [CU Boulder's account instructions](https://curc.readthedocs.io/en/latest/getting_started/logging-in.html). In the support form linked there, select:

* Institution: **Other RMACC Institution**
* Nature of request: **Login**
* Issue type: **I would like to request a CU Research Computing account**

Complete the requested information and wait for account confirmation. Follow the instructions for Duo multi-factor authentication.

Once the account is created, RMACC users automatically receive **Trailhead**, using the Slurm account **`rmacc-general`**, with approximately **2,000 service units per month**. There is no separate Explore application or credit exchange for this route. Trailhead supports initial testing and small jobs; heavier use lowers scheduling priority. The allocation is automatic, but account creation and job starts are not immediate.

Larger projects can request **RMACC Ascent**, currently 250,000 service units over 12 months. Follow the RMACC tab in [Alpine allocations](https://curc.readthedocs.io/en/latest/clusters/alpine/allocations.html) for current limits and application instructions.

CU Anschutz users should follow the separate **AMC** account and allocation instructions on those pages.

### Getting a GPU session

Sign into [RMACC Open OnDemand](https://ondemand-rmacc.rc.colorado.edu/), selecting **ACCESS CI (XSEDE)** as the identity provider. RMACC users currently use this browser portal for terminal and interactive access; direct SSH is unavailable. See the [Open OnDemand guide](https://curc.readthedocs.io/en/latest/open_ondemand/index.html).

For a first Jupyter GPU session, choose Jupyter from **Interactive Apps**, select **Custom configuration**, and use:

| Field | Example |
| --- | --- |
| Cluster | Alpine |
| Account | `rmacc-general` |
| Partition | `aa100` |
| QoS | `gpu-normal` |
| Time | 1 hour |
| CPU cores | 4 |
| `gres` | `gpu:a100-40gb:1` |

The `gres` field requests the GPU type and count. This example requests one full 40 GB A100 GPU on a shared node. Submit the session, wait for Slurm to start it, then connect to Jupyter. End the session when finished. Request an entire node only when your application needs its resources.

Check the current [application configuration instructions](https://curc.readthedocs.io/en/latest/open_ondemand/configuring_apps.html) and [GPU resource definitions](https://curc.readthedocs.io/en/latest/clusters/alpine/alpine-hardware.html) before changing GPU types, counts, or time limits. The [CU Boulder Research Computing User Guide](https://curc.readthedocs.io) also covers batch jobs, software, storage, and data transfers.

## Other resources

* [Software](https://www.ucdenver.edu/offices/office-of-information-technology/software) available at CU Denver for free or at a discounted rate.
* Virtual machines, storage, and other cloud resources, including [Amazon Web Services (AWS)](https://aws.amazon.com), [DigitalOcean](https://www.digitalocean.com), and [Google Cloud](https://cloud.google.com). These all require a credit card for the charges, but can be cheaper and more convenient than your own hardware. AWS is very comprehensive and has a fast interconnect suitable for a cluster, while DigitalOcean is cheaper and much more user friendly. Google developer account provides access to useful services such as the Google Maps API.
* [Google Colab](https://colab.research.google.com) is a free Jupyter notebook service optimized for machine learning.
