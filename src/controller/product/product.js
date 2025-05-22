'use strict';
export const product = async (req, res) => {
  const list_item = ['cooker', 'washingmachine', 'dish', 'car', 'fridge', 'ac'];
  return res.json(list_item);
};
export const plastic_item = async (req, res) => {
  const list_item = ['bottle', 'jug', 'mog', 'plate', 'glass', 'plastic spoon'];
  return res.json(list_item);
};
export const kitchen_items = async (req, res) => {
  const list_item = ['cooker', 'washingmachine', 'dish', 'car', 'fridge', 'ac'];
  return res.json(list_item);
};
export const study_items = async (req, res) => {
  const list_item = ['books', 'chair', 'tables', 'pen', 'pencil', 'scale'];
  return res.json(list_item);
};