-- Document Management System Tables (Oracle SQL compatible)

-- Users & Roles
CREATE TABLE Roles (
    role_id NUMBER PRIMARY KEY,
    role_name VARCHAR2(50)
);

CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(100),
    email VARCHAR2(150),
    full_name VARCHAR2(200)
);

CREATE TABLE User_Roles (
    user_id NUMBER REFERENCES Users(user_id),
    role_id NUMBER REFERENCES Roles(role_id),
    PRIMARY KEY (user_id, role_id)
);

-- Documents & Versions
CREATE TABLE Documents (
    document_id NUMBER PRIMARY KEY,
    title VARCHAR2(300),
    description VARCHAR2(1000),
    created_by NUMBER REFERENCES Users(user_id),
    created_at DATE,
    current_version_id NUMBER
);

CREATE TABLE Document_Versions (
    version_id NUMBER PRIMARY KEY,
    document_id NUMBER REFERENCES Documents(document_id),
    file_path VARCHAR2(500),
    file_size NUMBER,
    file_type VARCHAR2(100),
    version_number NUMBER,
    created_by NUMBER REFERENCES Users(user_id),
    created_at DATE,
    change_notes VARCHAR2(1000)
);

-- Tags & Metadata
CREATE TABLE Document_Tags (
    document_id NUMBER REFERENCES Documents(document_id),
    tag VARCHAR2(100),
    PRIMARY KEY (document_id, tag)
);

CREATE TABLE Metadata (
    metadata_id NUMBER PRIMARY KEY,
    document_id NUMBER REFERENCES Documents(document_id),
    meta_key VARCHAR2(200),
    meta_value VARCHAR2(200)
);

-- Permissions & Role Permissions
CREATE TABLE Permissions (
    permission_id NUMBER PRIMARY KEY,
    permission_name VARCHAR2(100) -- e.g., READ, WRITE, APPROVE
);

CREATE TABLE Role_Permissions (
    role_id NUMBER REFERENCES Roles(role_id),
    permission_id NUMBER REFERENCES Permissions(permission_id),
    PRIMARY KEY (role_id, permission_id)
);

-- Workflow management
CREATE TABLE Workflows (
    workflow_id NUMBER PRIMARY KEY,
    workflow_name VARCHAR2(200),
    description VARCHAR2(1000)
);

CREATE TABLE Workflow_Steps (
    step_id NUMBER PRIMARY KEY,
    workflow_id NUMBER REFERENCES Workflows(workflow_id),
    step_order NUMBER,
    step_name VARCHAR2(200),
    role_responsible NUMBER REFERENCES Roles(role_id)
);

CREATE TABLE Document_Workflow_Status (
    doc_id NUMBER REFERENCES Documents(document_id),
    workflow_id NUMBER REFERENCES Workflows(workflow_id),
    current_step_id NUMBER REFERENCES Workflow_Steps(step_id),
    status VARCHAR2(50),
    updated_at DATE,
    PRIMARY KEY (doc_id, workflow_id)
);

-- Audit log
CREATE TABLE Audit_Log (
    audit_id NUMBER PRIMARY KEY,
    entity VARCHAR2(100),
    entity_id VARCHAR2(100),
    action VARCHAR2(100),
    action_time DATE,
    performed_by NUMBER REFERENCES Users(user_id),
    details VARCHAR2(2000)
);
