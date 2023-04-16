const mongoose = require("mongoose");
mongoose
  // .connect("mongodb://localhost:27017/blog", {
  // .connect("mongodb://localhost:27017/blog/?replicaSet=rs&authSource=authDB", {
  .connect(
    "mongodb+srv://hemloworld:1234@cluster0.rcn3htc.mongodb.net/?retryWrites=true&w=majority",
    {
      useNewUrlParser: true,
      useUnifiedTopology: true,
      // useCreateIndex: true,
    }
  )
  // .connect(
  //   "mongodb+srv://pri:user1234@email.hgaop8l.mongodb.net/emailperso?retryWrites=true&w=majority",
  //   {
  //     useNewUrlParser: true,
  //     useUnifiedTopology: true,
  //     // useCreateIndex: true,
  //   }
  // )
  .then(() => {
    console.log("connection to db is successfull");
  })
  .catch((e) => {
    console.log("no connection", e);
  });
