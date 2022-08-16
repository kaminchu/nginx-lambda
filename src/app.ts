import proxy from "express-http-proxy";
import Express from "express";
import morgan from "morgan";

const app = Express();
app.use(morgan('combined'));
app.use(proxy("localhost:8080"));

export default app;
