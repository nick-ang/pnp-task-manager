require "test_helper"

class KanbansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kanban = kanbans(:one)
  end

  test "should get index" do
    get kanbans_url
    assert_response :success
  end

  test "should get new" do
    get new_kanban_url
    assert_response :success
  end

  test "should create kanban" do
    assert_difference('Kanban.count') do
      post kanbans_url, params: { kanban: { cards: @kanban.cards, description: @kanban.description, name: @kanban.name } }
    end

    assert_redirected_to kanban_url(Kanban.last)
  end

  test "should show kanban" do
    get kanban_url(@kanban)
    assert_response :success
  end

  test "should get edit" do
    get edit_kanban_url(@kanban)
    assert_response :success
  end

  test "should update kanban" do
    patch kanban_url(@kanban), params: { kanban: { cards: @kanban.cards, description: @kanban.description, name: @kanban.name } }
    assert_redirected_to kanban_url(@kanban)
  end

  test "should destroy kanban" do
    assert_difference('Kanban.count', -1) do
      delete kanban_url(@kanban)
    end

    assert_redirected_to kanbans_url
  end
end
