require "application_system_test_case"

class KanbansTest < ApplicationSystemTestCase
  setup do
    @kanban = kanbans(:one)
  end

  test "visiting the index" do
    visit kanbans_url
    assert_selector "h1", text: "Kanbans"
  end

  test "creating a Kanban" do
    visit kanbans_url
    click_on "New Kanban"

    fill_in "Cards", with: @kanban.cards
    fill_in "Description", with: @kanban.description
    fill_in "Name", with: @kanban.name
    click_on "Create Kanban"

    assert_text "Kanban was successfully created"
    click_on "Back"
  end

  test "updating a Kanban" do
    visit kanbans_url
    click_on "Edit", match: :first

    fill_in "Cards", with: @kanban.cards
    fill_in "Description", with: @kanban.description
    fill_in "Name", with: @kanban.name
    click_on "Update Kanban"

    assert_text "Kanban was successfully updated"
    click_on "Back"
  end

  test "destroying a Kanban" do
    visit kanbans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kanban was successfully destroyed"
  end
end
