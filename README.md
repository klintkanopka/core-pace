# core-pace
Repository for analysis of CORE SEL data. Note none of the data is retained in this repo.

- To get a sense for the flow, see main.R as it organizes the ancillary scripts.
- To replicate results, edit file_paths.R to point to your data directory and then run main.R
- To replicate reports, knit the appropriate report. This requires LaTeX and stargazer.

# Changelog:

**2019.05.08**

- Added scripts and initial report.
- Fit four main models - note that the SEs are **not** robust SEs. These are VERY slow to compute. Uncomment appropriate code in the test_#.R scripts and the report_1.Rmd to implement.
