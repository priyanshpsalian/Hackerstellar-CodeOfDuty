const express = require("express");
var ObjectId = require("mongodb").ObjectId;
const router = express.Router();
require("../../db/conn");
const blog_model = require("../../models/blog");
const user_model = require("../../models/register_user");
const cors = require("cors");
router.use(express.json());
router.use(cors());
router.get("/getBlogById/:id", async (req, res) => {
  try {
    // console.log("K");
    let blogId = req.params.id;
    // const { title, description } = req.body;
    // console.log("L");
    // const update = await blog_model.findById(blogId);
    const update = await blog_model.find({ user: ObjectId(`${blogId}`) });

    // console.log("KKK");
    res.status(201).send(update);
  } catch (e) {
    console.log(e);
  }
});