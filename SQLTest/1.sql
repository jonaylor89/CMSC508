
CREATE TABLE hr_projects (
    project_number NUMBER(7) PRIMARY KEY,
    project_name VARCHAR2(25) NOT NULL,
    project_manager NUMBER(7) REFERENCES employees,
    project_department NUMBER(7) REFERENCES departments,
    project_budget NUMBER(7)
)

