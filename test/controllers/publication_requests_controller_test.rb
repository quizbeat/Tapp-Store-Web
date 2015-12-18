require 'test_helper'

class PublicationRequestsControllerTest < ActionController::TestCase
  setup do
    @publication_request = publication_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publication_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publication_request" do
    assert_difference('PublicationRequest.count') do
      post :create, publication_request: { app_id: @publication_request.app_id, moderator_id: @publication_request.moderator_id, request_date: @publication_request.request_date, status: @publication_request.status }
    end

    assert_redirected_to publication_request_path(assigns(:publication_request))
  end

  test "should show publication_request" do
    get :show, id: @publication_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publication_request
    assert_response :success
  end

  test "should update publication_request" do
    patch :update, id: @publication_request, publication_request: { app_id: @publication_request.app_id, moderator_id: @publication_request.moderator_id, request_date: @publication_request.request_date, status: @publication_request.status }
    assert_redirected_to publication_request_path(assigns(:publication_request))
  end

  test "should destroy publication_request" do
    assert_difference('PublicationRequest.count', -1) do
      delete :destroy, id: @publication_request
    end

    assert_redirected_to publication_requests_path
  end
end
