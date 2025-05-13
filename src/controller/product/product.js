
const product = async(req,res)=>{
    const list_item = ["cooker","washingmaching","dish","car","fridge","ac"]
    return await res.status(200).json(list_item)
}

module.exports = {
    product
}