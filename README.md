# core-pace
Repository for analysis of CORE SEL data. Note none of the data is retained in this repo.

- To get a sense for the flow, see main.R as it organizes the ancillary scripts.
- To replicate results, edit file_paths.R to point to your data directory and then run main.R
- To replicate reports, knit the appropriate report. This requires LaTeX and stargazer.

# Files:

- **main.R** - Calls all helper scripts in order.
- **file_paths.R** - Contains filepaths to aid in organization and replication of results.
- **read_data.R** - Reads in data, builds a file of tests and a file of student information with associated school characteristics. Note that SEL data is housed in the *student* file.
- **test_1.R** - Matches students to Smarter Balanced ELA test scores and fits four initial panel models to the data.
- **test_2.R** - Matches students to Smarter Balanced Math test scores and fits four initial panel models to the data.
- **report_1.Rmd** - Also compiles subscripts and produces regression tables in a .pdf.

# Changelog:

**2019.05.08**

- Added scripts and initial report.
- Fit four main models - note that the robust SEs are slow to compute.
- Subgroup analysis forthcoming.
