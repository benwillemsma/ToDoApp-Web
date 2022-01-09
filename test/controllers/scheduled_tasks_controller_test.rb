require 'test_helper'

class ScheduledTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_task = scheduled_tasks(:one)
  end

  test "should get index" do
    get scheduled_tasks_url, as: :json
    assert_response :success
  end

  test "should create scheduled_task" do
    assert_difference('ScheduledTask.count') do
      post scheduled_tasks_url, params: { scheduled_task: { due: @scheduled_task.due, finished: @scheduled_task.finished, interval: @scheduled_task.interval, start: @scheduled_task.start, task_id: @scheduled_task.task_id } }, as: :json
    end

    assert_response 201
  end

  test "should show scheduled_task" do
    get scheduled_task_url(@scheduled_task), as: :json
    assert_response :success
  end

  test "should update scheduled_task" do
    patch scheduled_task_url(@scheduled_task), params: { scheduled_task: { due: @scheduled_task.due, finished: @scheduled_task.finished, interval: @scheduled_task.interval, start: @scheduled_task.start, task_id: @scheduled_task.task_id } }, as: :json
    assert_response 200
  end

  test "should destroy scheduled_task" do
    assert_difference('ScheduledTask.count', -1) do
      delete scheduled_task_url(@scheduled_task), as: :json
    end

    assert_response 204
  end
end
