'use strict';
export const product = async (req, res) => {
  const list_item = ['cooker', 'washingmachine', 'dish', 'car', 'fridge', 'ac'];
  return res.json(list_item);
};
