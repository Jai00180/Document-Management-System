# 📁 Document Management System

**Author:** Vandana Tanwar  
**Project Type:** DBMS / Oracle SQL  
**Date Generated:** 2025-10-27

## 📝 Project Description
The Document Management System (DMS) handles document storage, versioning, access control, and workflow management with metadata tracking.  
It supports document uploads, version history, role-based access permissions, document lifecycle workflows, and audit trails.

## 🎯 System Features
- Document storage with metadata (title, author, tags, created_at).  
- Version control for documents with rollback capability.  
- Role-based access control (read, write, approve).  
- Workflow management (draft → review → approved → archived).  
- Full audit trail for document actions (upload, edit, approve, delete).  
- Search by metadata and tags.  
- Attachment handling and file-type support tracking.

## 📁 Database Tables (suggested)
- Users, Roles, User_Roles
- Documents, Document_Versions, Document_Tags
- Permissions, Role_Permissions
- Workflows, Workflow_Steps, Document_Workflow_Status
- Audit_Log, Metadata

## ⚙️ How to Run
1. Install Oracle Database or use [Oracle Live SQL](https://livesql.oracle.com/).  
2. Run the scripts in order:
   ```sql
   tables.sql        -- create tables and constraints
   insert_data.sql   -- sample data inserts
   queries.sql       -- example queries & reports
   ```
3. Verify created tables:
   ```sql
   SELECT table_name FROM user_tables ORDER BY table_name;
   ```

## 🧾 Files in this package
- `README.md` — Project documentation (this file)  
- `tables.sql` — Oracle-compatible table creation script  
- `insert_data.sql` — Sample data to populate the schema  
- `queries.sql` — Useful queries for operations & analytics  
- `er_diagram.png` — ER diagram placeholder image

---

## 🧠 Future Enhancements
- Integrate with S3 or blob storage for actual file storage.  
- Implement full-text search with Oracle Text.  
- Add triggers to auto-create versions and audit entries.  
- Build REST API + web UI for document upload and workflow management.  
