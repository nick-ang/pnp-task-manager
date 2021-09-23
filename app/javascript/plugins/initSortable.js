import Sortable from "sortablejs";
import Rails from "@rails/ujs";

const initKanbanSortable = (ulElements) => {
  const saveKanbanBinded = saveKanban.bind(null, ulElements);
  ulElements.forEach((ul) => {
    new Sortable(ul, {
      group: "kanban", // set both lists to same group
      animation: 300,
      onEnd: saveKanbanBinded,
    });
  });
};

const kanbanForm = document.querySelector(".kanban-form-input");
const saveKanban = (ulElements) => {
  // Let's build an Object kanbanIds containing all the kanban Ids
  // E.g. :
  // {
  //   "columns": [
  //     { "id": 1, "itemIds": [3, 2] },
  //     { "id": 2, "itemIds": [4, 5] },
  //     { "id": 3, "itemIds": [6, 1] }
  //   ]
  // }
  const kanbanIds = { columns: [] };
  ulElements.forEach((ul) => {
    const itemIds = [];
    ul.querySelectorAll(".kanban-col-item").forEach((item) =>
      itemIds.push(Number.parseInt(item.dataset.itemId, 10))
    );
    kanbanIds.columns.push({
      id: Number.parseInt(ul.dataset.colId, 10),
      itemIds: itemIds,
    });
  });
  // kanbanForm.value = JSON.stringify(kanbanIds);
  const kanbanId = document.querySelector(".kanban").dataset.id;
  const formData = new FormData();
  formData.append("kanban[kanbanIds]", JSON.stringify(kanbanIds));
  Rails.ajax({
    url: `/kanbans/${kanbanId}/sort`,
    type: "patch",
    data: formData,
  });
};

export { initKanbanSortable };
