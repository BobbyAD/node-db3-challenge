const db = require("../data/db.js");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes").where("id", id);
}

function findSteps(id) {
    return db("steps")
        .join("schemes", "schemes.id", "steps.scheme_id")
        .where("schemes.id", id)
        .orderBy("step_number");
}

function add(scheme) {
    return db('schemes').insert(scheme)
        .then(ids => {
            return db('schemes').where({ id: ids[0] }).first();
        })
}

function update(changes, id) {
    return db('schemes').where('id', id).update(changes, '*')
        .then(ids => {
            return db('schemes').where('id', id);
        })
}

function remove(id) {
    return db('schemes')
        .where('id', id)
        .del();
}