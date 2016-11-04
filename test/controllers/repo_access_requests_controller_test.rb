require 'test_helper'

class RepoAccessRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repo_access_request = repo_access_requests(:one)
  end

  test "should get index" do
    get repo_access_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_repo_access_request_url
    assert_response :success
  end

  test "should create repo_access_request" do
    assert_difference('RepoAccessRequest.count') do
      post repo_access_requests_url, params: { repo_access_request: { level: @repo_access_request.level, repo_group: @repo_access_request.repo_group, repository: @repo_access_request.repository, request_action: @repo_access_request.request_action, user_id: @repo_access_request.user_id } }
    end

    assert_redirected_to repo_access_request_url(RepoAccessRequest.last)
  end

  test "should show repo_access_request" do
    get repo_access_request_url(@repo_access_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_repo_access_request_url(@repo_access_request)
    assert_response :success
  end

  test "should update repo_access_request" do
    patch repo_access_request_url(@repo_access_request), params: { repo_access_request: { level: @repo_access_request.level, repo_group: @repo_access_request.repo_group, repository: @repo_access_request.repository, request_action: @repo_access_request.request_action, user_id: @repo_access_request.user_id } }
    assert_redirected_to repo_access_request_url(@repo_access_request)
  end

  test "should destroy repo_access_request" do
    assert_difference('RepoAccessRequest.count', -1) do
      delete repo_access_request_url(@repo_access_request)
    end

    assert_redirected_to repo_access_requests_url
  end
end
