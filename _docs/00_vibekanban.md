# user-vibe_kanban: Toàn bộ tính năng

`user-vibe_kanban` là MCP server để quản lý issue/task, repository, workspace và session cho quy trình làm việc coding agent.

## 1) Khám phá Organization / Project / Repository

- `list_organizations`: Liệt kê toàn bộ organization khả dụng.
- `list_org_members`: Liệt kê thành viên trong organization (có thể bỏ qua `organization_id` nếu đang ở workspace đã link).
- `list_projects`: Liệt kê project theo organization.
- `list_repos`: Liệt kê tất cả repository.
- `get_repo`: Lấy thông tin chi tiết repository (bao gồm scripts).

## 2) Quản lý Issue

- `list_issues`: Liệt kê issue theo project, hỗ trợ pagination, filter (status, priority, tag, assignee, query, parent issue), và sort.
- `get_issue`: Lấy chi tiết 1 issue.
- `create_issue`: Tạo issue mới (có hỗ trợ tạo subissue qua `parent_issue_id`).
- `update_issue`: Cập nhật issue (title, description, status, priority, parent issue).
- `delete_issue`: Xóa issue.

## 3) Assignee / Tag / Relationship của Issue

- `list_issue_assignees`: Liệt kê assignee của issue.
- `assign_issue`: Gán user vào issue.
- `unassign_issue`: Gỡ assignee khỏi issue (theo `issue_assignee_id`).
- `list_tags`: Liệt kê tag của project.
- `list_issue_tags`: Liệt kê tag đang gắn trên issue.
- `add_issue_tag`: Gắn tag vào issue.
- `remove_issue_tag`: Gỡ tag khỏi issue (theo `issue_tag_id`).
- `list_issue_priorities`: Liệt kê các giá trị priority hợp lệ.
- `create_issue_relationship`: Tạo quan hệ giữa 2 issue (`blocking`, `related`, `has_duplicate`).
- `delete_issue_relationship`: Xóa quan hệ giữa 2 issue.

## 4) Vòng đời Workspace

- `list_workspaces`: Liệt kê workspace local (có filter archived, pinned, branch, name + pagination).
- `start_workspace`: Tạo workspace mới và chạy session đầu tiên (có thể link `issue_id`, chọn `executor`, repo/branch).
- `update_workspace`: Cập nhật trạng thái workspace (`archived`, `pinned`, `name`).
- `delete_workspace`: Xóa workspace local; có tùy chọn xóa linked remote workspace và branch liên quan.
- `link_workspace_issue`: Link workspace với issue remote để theo dõi.

## 5) Session và Agent Execution

- `create_session`: Tạo session mới trong workspace.
- `list_sessions`: Liệt kê sessions của workspace.
- `update_session`: Đổi tên session.
- `run_session_prompt`: Chạy 1 turn coding agent trong session, trả về execution process ngay.
- `get_execution`: Kiểm tra trạng thái 1 execution.

## 6) Repository Scripts cho Workspace Automation

- `update_setup_script`: Cập nhật setup script của repository (chạy khi khởi tạo workspace).
- `update_dev_server_script`: Cập nhật dev server script (chạy server phát triển).
- `update_cleanup_script`: Cập nhật cleanup script (chạy khi teardown workspace).

## Ghi chú sử dụng để ổn định

- Nên gọi các tool `list_*` / `get_*` trước để lấy ID và trạng thái hiện tại.
- Nhiều tool hỗ trợ bỏ qua ID khi đang chạy trong đúng workspace/project context.
