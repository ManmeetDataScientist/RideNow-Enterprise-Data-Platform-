# RideNow Enterprise Data Platform

# 07. GitHub FAQ

---

# Document Information

| Property | Value |
|----------|-------|
| Project | RideNow Enterprise Data Platform |
| Document | GitHub FAQ |
| Version | 1.0 |
| Author | Manmeet Singh |
| Last Updated | July 2026 |

---

# Table of Contents

1. Git Fundamentals
2. GitHub Basics
3. Repository Management
4. Branching Strategy
5. Commits
6. Pull Requests
7. Collaboration
8. GitHub Actions
9. Best Practices
10. RideNow Implementation

---

# 1. Git Fundamentals

## Q1. What is Git?

**Answer**

Git is a distributed version control system used to track changes in source code and collaborate with multiple developers.

**RideNow Example**

The entire RideNow project, including SQL scripts, Python code, documentation, and dashboards, is managed using Git.

**Interview Tip**

Know the difference between Git (tool) and GitHub (hosting platform).

---

## Q2. What is Version Control?

Version control records changes made to files over time, allowing developers to review history, restore previous versions, and collaborate safely.

---

## Q3. What is a Repository?

A repository (repo) stores all project files, commit history, branches, and documentation.

Example:

RideNow Enterprise Data Platform

---

## Q4. Difference between Git and GitHub?

| Git | GitHub |
|------|---------|
| Version Control System | Cloud Hosting Platform |
| Local Tool | Remote Repository |
| Tracks Changes | Collaboration & Sharing |

---

## Q5. Why use Git?

Benefits:

- Version history
- Team collaboration
- Backup
- Rollback
- Branching
- Code reviews

---

# 2. GitHub Basics

## Q6. What is GitHub?

GitHub is a cloud-based platform that hosts Git repositories and provides collaboration features.

---

## Q7. Why use GitHub?

- Remote repository
- Collaboration
- Issue tracking
- Pull Requests
- CI/CD
- Documentation

---

## Q8. What is GitHub Desktop?

A graphical application that simplifies Git operations without using the command line.

---

## Q9. What is GitHub Codespaces?

A cloud-hosted development environment for coding directly from GitHub.

---

## Q10. What is a README?

README.md is the project's primary documentation file that explains the project, architecture, setup, and usage.

---

# 3. Repository Management

## Q11. Why organize repositories?

Good organization improves:

- Navigation
- Maintenance
- Team collaboration

---

## Q12. Why use folders?

Folders separate project components.

Example:

- docs
- sql
- python
- powerbi
- tests

---

## Q13. What is .gitignore?

A file that specifies which files Git should ignore.

Examples:

- __pycache__
- *.log
- .env

---

## Q14. Why include a LICENSE?

A license defines how others may use your project.

---

## Q15. Why use RELEASE_NOTES.md?

Release notes document project changes across versions.

---

# 4. Branching Strategy

## Q16. What is a Branch?

A branch is an independent line of development.

---

## Q17. What is the Main branch?

The stable production-ready branch.

---

## Q18. Why create feature branches?

Feature branches isolate development and reduce risk.

Example:

feature/python-generator

feature/bronze-layer

---

## Q19. What is merging?

Combining changes from one branch into another.

---

## Q20. What is a merge conflict?

Occurs when Git cannot automatically combine changes from different branches.

---

# 5. Commits

## Q21. What is a Commit?

A commit is a snapshot of changes in the repository.

---

## Q22. Why write meaningful commit messages?

Good commit messages improve project history.

Example:

✔ Add Bronze Layer table creation scripts

Instead of:

✖ Update files

---

## Q23. Recommended commit message format?

- Add
- Update
- Fix
- Remove
- Refactor
- Improve

---

## Q24. What is commit history?

A chronological record of all project changes.

---

## Q25. Can commits be reverted?

Yes.

Git supports reverting changes while preserving history.

---

# 6. Pull Requests

## Q26. What is a Pull Request?

A Pull Request (PR) requests that changes from one branch be reviewed and merged into another.

---

## Q27. Why use Pull Requests?

- Code Review
- Discussion
- Testing
- Quality Assurance

---

## Q28. What is Code Review?

The process of reviewing code before merging.

---

## Q29. Should developers commit directly to main?

No.

Enterprise teams generally use feature branches and Pull Requests.

---

## Q30. What is Squash Merge?

Combines multiple commits into a single commit during merge.

---

# 7. Collaboration

## Q31. What are GitHub Issues?

Issues track:

- Bugs
- Tasks
- Enhancements

---

## Q32. What are GitHub Discussions?

A forum for project-related conversations and knowledge sharing.

---

## Q33. What are Labels?

Labels categorize issues and pull requests.

Example:

- Bug
- Enhancement
- Documentation

---

## Q34. What are Milestones?

Milestones group issues into project goals or releases.

---

## Q35. What are Projects?

GitHub Projects provide Kanban-style task management.

---

# 8. GitHub Actions

## Q36. What are GitHub Actions?

GitHub Actions automate workflows such as:

- Build
- Test
- Deploy

---

## Q37. Why use GitHub Actions?

Benefits:

- Continuous Integration
- Continuous Deployment
- Automated Testing

---

## Q38. Can RideNow use GitHub Actions?

Yes.

Future automation may include:

- SQL validation
- Python testing
- Documentation checks

---

## Q39. What is a Workflow?

A workflow defines automated tasks triggered by GitHub events.

---

## Q40. Where are workflows stored?

```

.github/workflows/

```

---

# 9. Best Practices

## Q41. What are GitHub best practices?

- Write good documentation
- Use branches
- Review code
- Follow naming standards
- Keep commits small
- Maintain release notes

---

## Q42. Why maintain documentation?

Documentation helps:

- Onboarding
- Maintenance
- Knowledge sharing

---

## Q43. Why use Markdown?

Markdown is lightweight, readable, and supported natively by GitHub.

---

## Q44. Should large files be committed?

Generally no.

Use Git LFS for large binary files if needed.

---

## Q45. How should repositories be structured?

A consistent folder hierarchy improves readability and maintainability.

---

# 10. RideNow Implementation

## Q46. How is RideNow organized?

```

RideNow/
│
├── docs/
├── sql/
├── python/
├── snowflake/
├── powerbi/
├── tests/
├── .github/
├── README.md
├── LICENSE
└── RELEASE_NOTES.md

```

---

## Q47. Why is documentation a major focus?

Enterprise projects require architecture documents, standards, FAQs, release notes, and implementation guides to support collaboration and long-term maintenance.

---

## Q48. Why are SQL scripts modular?

Each script performs a single responsibility, making deployments easier and reducing risk.

---

## Q49. Why are standards documented separately?

Separate standards documents ensure consistency across SQL, Python, and documentation.

---

## Q50. What is the biggest GitHub lesson from RideNow?

A successful repository is more than code—it combines clean architecture, clear documentation, version control, automation, and maintainability to reflect enterprise engineering practices.

---

# References

- Git Documentation
- GitHub Documentation
- GitHub Actions Documentation
- RideNow Repository Standards

---

**Document Status:** Approved

**Version:** 1.0

**Maintained By:** Manmeet Singh
