import Route from "@ember/routing/route";
import { action } from "@ember/object";

export default class IndexRoute extends Route {
  async model() {
    let response = await fetch("https://hsncjy-8000.csb.app/todos/");
    return await response.json();
  }

  @action
  changeCreateTodoState() {
    this.createTodoOpened = !this.createTodoOpened;
  }
}
