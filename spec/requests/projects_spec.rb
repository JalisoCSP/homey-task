RSpec.describe "Projects", type: :request do
  let(:project) do
    create(:project)
  end

  before do
    # TODO:
    # sign_in(user)
  end

  describe "GET /index" do
    it "renders the index page" do
      get projects_path
      expect(response).to be_successful
      expect(response.body).to include("Projects")
    end
  end

  describe "GET /show" do
    it "renders the show page for a valid project" do
      get project_path(project)
      expect(response).to be_successful
      expect(response.body).to include(project.name)
    end

    it "redirects if the project is not found" do
      get project_path(id: "invalid")
      expect(response).to redirect_to(projects_path)
      follow_redirect!
      expect(response.body).to include("Project not found.")
    end
  end

  describe "GET /new" do
    it "renders the new project form" do
      get new_project_path
      expect(response).to be_successful
      expect(response.body).to include("New Project")
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new project" do
        expect do
          post projects_path, params: { project: { name: "New Project", status: "draft" } }
        end.to change(Project, :count).by(1)

        expect(response).to redirect_to(project_path(Project.last))
        follow_redirect!
        expect(response.body).to include("Project created successfully.")
      end
    end

    context "with invalid parameters" do
      it "does not create a project" do
        expect do
          post projects_path, params: { project: { name: "", status: "draft" } }
        end.not_to change(Project, :count)
      end
    end
  end

  describe "GET /edit" do
    it "renders the edit project form" do
      get edit_project_path(project)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the project" do
        patch project_path(project), params: { project: { name: "Updated Name" } }
        expect(response).to redirect_to(project_path(project))
        follow_redirect!
        expect(response.body).to include("Project updated successfully.")
        expect(project.reload.name).to eq("Updated Name")
      end
    end

    context "with invalid parameters" do
      it "does not update the project" do
        patch project_path(project), params: { project: { name: "" } }
        expect(project.reload.name).not_to eq("")
      end
    end
  end

  describe "DELETE /destroy" do
    it "deletes the project" do
      expect do
        delete project_path(project)
      end.to change(Project, :count).by(-1)

      expect(response).to redirect_to(projects_path)
      follow_redirect!
      expect(response.body).to include("Project deleted successfully.")
    end
  end
end
