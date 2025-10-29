-- Example queries for Document Management System (Oracle SQL)

-- 1. List documents with latest version info
SELECT d.document_id, d.title, dv.version_number, dv.file_path, dv.created_at
FROM Documents d
JOIN Document_Versions dv ON d.document_id = dv.document_id
WHERE dv.version_id = (
    SELECT MAX(version_id) FROM Document_Versions dv2 WHERE dv2.document_id = d.document_id
);

-- 2. Documents pending review (based on workflow status)
SELECT d.document_id, d.title, dws.status, dws.current_step_id
FROM Documents d
JOIN Document_Workflow_Status dws ON d.document_id = dws.doc_id
WHERE dws.status = 'In Review';

-- 3. Users with admin role
SELECT u.user_id, u.username, u.full_name
FROM Users u
JOIN User_Roles ur ON u.user_id = ur.user_id
JOIN Roles r ON ur.role_id = r.role_id
WHERE r.role_name = 'Admin';

-- 4. Audit log for a specific document
SELECT * FROM Audit_Log WHERE entity = 'Documents' AND entity_id = '2001' ORDER BY action_time DESC;

-- 5. Search documents by tag
SELECT d.document_id, d.title
FROM Documents d
JOIN Document_Tags dt ON d.document_id = dt.document_id
WHERE dt.tag = 'HR';
