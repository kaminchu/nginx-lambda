import serverlessExpress from "@vendia/serverless-express";
import { execSync } from "child_process";
import app from "./app";

console.log(__dirname)

execSync(`${__dirname}/nginx/nginx -c ${__dirname}/../nginx_conf/nginx.conf`);


exports.handler = serverlessExpress({ app });
