import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();
import express from 'express';
import cors from 'cors';
import sgMail from '@sendgrid/mail';
var app = express()
app.use(express.json())

app.use(cors({ origin: 'http://localhost:3000' }));

app.post("/contact", async(req, res) => { // async function by using await (do not distub other functions ) which return promice
    console.log({ "Received Data from Client": req.body })
    const {
        name,
        age,
        gender,
        address,
        email,
    } = req.body; //requset to acquire the data from the "/inputcreate" end point
    //-------------------------------------SignUp client mail---------------------


    const emailSend = "Email sent successfully!";
    const appName = "Muscle Fitness";

    sgMail.setApiKey(process.env.SENDGRID_API_KEY);

    const msg = {
        to: `${email}`,
        from: 'vaibhav.dabral@globtier.in',
        subject: `Thank You for Registering with ${appName}`,
        text: `
    Dear ${name},
    
    Thank you for registering with ${appName}.
    
    Now you can avail the full feature of the Muscle Fitness. If you have any questions or concerns, please do not hesitate to contact our customer support team
    at support. We are available to assist you with any issues you may encounter.
    
    Best regards,
    Vaibhav Dabral
    `
    };
    //---------------------------------------------------------------------------------
    sgMail.send(msg)
        .then(() => console.log(emailSend))
        .catch((error) => console.error(error));


    const result = await prisma.gymbackend_data.create({
        data: {
            name: name,
            age: age,
            gender: gender,
            address: address,
            email: email,
        },
    });
    res.json({
        status: "SUCCESS",
        Message: "contact-us ",
        data: result,
    });
    console.log(result)
});


app.get("/readall", async(req, res) => {
    const users = await prisma.gymbackend_data.findMany();
    res.json({
        Status: "  SUCCESS",
        Message: "Clients data",
        data: users
    });
});


app.delete("/delete", async(req, res) => {
    console.log({ "Received Data from Client": req.body })
    const { id } = req.body;
    const delet = await prisma.gymbackend_data.delete({
        where: {
            id,
        },
    });
    res.json(delet);
    console.log(delet);
});


app.listen(5000, () => {
    console.log("the server is live in the backend .");
});