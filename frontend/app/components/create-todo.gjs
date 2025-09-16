import Component from "@glimmer/component";
import { service } from "@ember/service";
import { action } from "@ember/object";
import { on } from "@ember/modifier";

export default class CreateTodo extends Component {
  @service router;

  @action
  async createTodo() {
    let totalNumTodos = 0;
    const totalTodosList = await fetch("https://hsncjy-8000.csb.app/todos")
      .then((totalTodos) => {
        return totalTodos.json();
      });

    totalTodosList.forEach((todoIndiv) => {
      totalNumTodos += 1;
    })

    const title = document.getElementById("title-input").value;
    const description = document.getElementById("description-input").value;

    console.log(title);
    console.log(description);
    console.log(totalNumTodos + 1);

    const buildTodo = {
      id: totalNumTodos + 1,
      title: title,
      author: 'Nate',
      description: description
    }

    await fetch("https://hsncjy-8000.csb.app/todos/", {
      method: 'POST',
      headers: {"content-type": "application/json"},
      body: JSON.stringify(buildTodo)
    }).then((res) => {
      this.router.transitionTo('index');
    });
  }

  <template>
    <div class="create-todo-form-container">
      <form class="create-todo-form">
        <label for="title-input">Title:</label>
        <input type="text" id="title-input" required />

        <br />

        <label for="description-input">Description:</label>
        <input type="text" id="description-input" required />

        <br />

        <button {{on "click" this.createTodo}} type="button">Create</button>
      </form>
    </div>
  </template>
}