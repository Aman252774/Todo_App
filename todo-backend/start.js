const app = require("./server")
const connectDB = require("./db")

connectDB().then(() => console.log("MongoDB connected!")).catch(err => console.error(err));

const PORT = process.env.PORT || 3002;
app.listen(PORT,()=>{
    console.log(`Server is running on the port ${PORT}`)
})