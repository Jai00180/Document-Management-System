-- Sample data for Document Management System (Oracle SQL)

-- Roles
INSERT INTO Roles VALUES (1,'Admin');
INSERT INTO Roles VALUES (2,'Editor');
INSERT INTO Roles VALUES (3,'Reviewer');
INSERT INTO Roles VALUES (4,'Viewer');

-- Users
INSERT INTO Users VALUES (1001,'v.tanwar','vandana@example.com','Vandana Tanwar');
INSERT INTO Users VALUES (1002,'alice','alice@example.com','Alice Sharma');
INSERT INTO Users VALUES (1003,'bob','bob@example.com','Bob Verma');

-- User Roles
INSERT INTO User_Roles VALUES (1001,1);
INSERT INTO User_Roles VALUES (1002,2);
INSERT INTO User_Roles VALUES (1003,3);

-- Permissions
INSERT INTO Permissions VALUES (1,'READ');
INSERT INTO Permissions VALUES (2,'WRITE');
INSERT INTO Permissions VALUES (3,'APPROVE');
INSERT INTO Permissions VALUES (4,'DELETE');

-- Role Permissions (example)
INSERT INTO Role_Permissions VALUES (1,1);
INSERT INTO Role_Permissions VALUES (1,2);
INSERT INTO Role_Permissions VALUES (1,3);
INSERT INTO Role_Permissions VALUES (2,1);
INSERT INTO Role_Permissions VALUES (2,2);
INSERT INTO Role_Permissions VALUES (3,1);
INSERT INTO Role_Permissions VALUES (3,3);
INSERT INTO Role_Permissions VALUES (4,1);

-- Documents
INSERT INTO Documents VALUES (2001,'Employee Handbook','Company employee policies and guidelines',1001,TO_DATE('2025-10-01','YYYY-MM-DD'),NULL);
INSERT INTO Documents VALUES (2002,'Project Plan Q4','Project planning document',1002,TO_DATE('2025-10-05','YYYY-MM-DD'),NULL);

-- Document Versions
INSERT INTO Document_Versions VALUES (3001,2001,'/docs/employee_handbook_v1.pdf',102400,'application/pdf',1,1001,TO_DATE('2025-10-01','YYYY-MM-DD'),'Initial version');
INSERT INTO Document_Versions VALUES (3002,2002,'/docs/project_plan_q4_v1.docx',51200,'application/vnd.openxmlformats-officedocument.wordprocessingml.document',1,1002,TO_DATE('2025-10-05','YYYY-MM-DD'),'Initial draft');

-- Tags & Metadata
INSERT INTO Document_Tags VALUES (2001,'HR');
INSERT INTO Document_Tags VALUES (2002,'Planning');
INSERT INTO Metadata VALUES (4001,2001,'confidentiality','internal');
INSERT INTO Metadata VALUES (4002,2002,'department','IT');

-- Workflows & Steps
INSERT INTO Workflows VALUES (5001,'Document Approval Workflow','Draft -> Review -> Approve -> Publish');
INSERT INTO Workflow_Steps VALUES (6001,5001,1,'Draft',2);
INSERT INTO Workflow_Steps VALUES (6002,5001,2,'Review',3);
INSERT INTO Workflow_Steps VALUES (6003,5001,3,'Approve',1);

-- Document Workflow Status
INSERT INTO Document_Workflow_STATUS VALUES (2001,5001,6002,'In Review',TO_DATE('2025-10-06','YYYY-MM-DD'));

-- Audit Log
INSERT INTO Audit_Log VALUES (7001,'Documents','2001','Created',TO_DATE('2025-10-01','YYYY-MM-DD'),1001,'Document uploaded by Vandana');
INSERT INTO Audit_Log VALUES (7002,'Document_Versions','3001','Created',TO_DATE('2025-10-01','YYYY-MM-DD'),1001,'Initial version uploaded');
