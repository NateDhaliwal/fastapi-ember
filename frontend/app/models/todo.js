import Model, { attr } from "@ember-data/model";

export default class TodoModel extends Model {
  @attr("string") title;
  @attr("string") author;
  @attr("string") description;
  @attr("number") id;
  @attr("boolean") done;
}
