require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { children_id: @task.children_id, failure: @task.failure, name: @task.name, parent_id: @task.parent_id, positoin: @task.positoin, scheduledTask_id: @task.scheduledTask_id, success: @task.success, urgency: @task.urgency, webLink: @task.webLink } }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get task_url(@task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { children_id: @task.children_id, failure: @task.failure, name: @task.name, parent_id: @task.parent_id, positoin: @task.positoin, scheduledTask_id: @task.scheduledTask_id, success: @task.success, urgency: @task.urgency, webLink: @task.webLink } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task), as: :json
    end

    assert_response 204
  end
end
