const db = require("../models");
const Users = db.users;
const Op = db.Sequelize.Op;

// Create and Save a new Users
exports.create = (req, res) => {
    // Validate request
    if (!req.body.title) {
      res.status(400).send({
        message: "Content can not be empty!"
      });
      return;
    }
  
    // Create a Users
    const Users = {
      usrename: "name",
      email: req.body.email,
      password: req.body.password
    };
  
    // Save Users in the database
    Users.create(Users)
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while creating the Users."
        });
      });
  };
// Retrieve all users from the database.
exports.findAll = (req, res) => {
    const title = req.query.title;
    var condition = title ? { title: { [Op.like]: `%${title}%` } } : null;
  
    Users.findAll({ where: condition })
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message:
            err.message || "Some error occurred while retrieving Users."
        });
      });
  };

// Find a single users with an id
exports.singin = (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  Users.findOne({
    where: {
      email: email,
      password: password
    }
  })
    .then(data => {
      if (!data) {
        return res.status(404).send({ message: "User Not found." });
      }else{
      res.send(data);
      }

    })
    .catch(err => {
      res.status(500).send({ message: err.message });
    });
  };
  

// Find a single Users with an id
exports.findOne = (req, res) => {
    const id = req.params.id;
  
    Users.findByPk(id)
      .then(data => {
        res.send(data);
      })
      .catch(err => {
        res.status(500).send({
          message: "Error retrieving Users with id=" + id
        });
      });
  };

// Update a Users by the id in the request
exports.update = (req, res) => {
  
};

// Delete a Users with the specified id in the request
exports.delete = (req, res) => {
  
};

// Delete all users from the database.
exports.deleteAll = (req, res) => {
  
};

// Find all published users
exports.findAllPublished = (req, res) => {
  
};