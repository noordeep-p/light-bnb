/* eslint-disable camelcase */
const { Pool } = require('pg');
// const properties = require('./json/properties.json');
// const users = require('./json/users.json');

const pool = new Pool({
  user: 'vagrant',
  password: 'lighthouse',
  host: 'localhost',
  database: 'lightbnb'
});

/// Users

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const getUserWithEmail = function(email) {
  let user;
  const queryString = `SELECT * FROM users WHERE email = $1`;

  return pool.query(queryString, [email])
    .then(res => {
      if (res.rows[0]) {
        user = res.rows[0];
      } else {
        user = null;
      }
      return user;
    }).catch(e => console.log(e));
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */

const getUserWithId = function(id) {
  let user;
  const queryString = `SELECT * FROM users WHERE id = $1`;

  return pool.query(queryString, [id])
    .then(res => {
      if (res.rows[0]) {
        user = res.rows[0];
      } else {
        user = null;
      }
      return user;
    }).catch(e => console.log(e));
};
exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */

const addUser =  function(user) {
  const text = 'INSERT INTO users(name, email, password) VALUES($1, $2, $3) RETURNING *';
  const values = [user.name, user.email, user.password];

  return pool.query(text, values)
    .then(res => {
      return res.rows[0];
    })
    .catch(e => console.log(e));
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function(guest_id, limit = 10) {

  let queryString = `SELECT * FROM reservations WHERE guest_id = $1 LIMIT $2`;

  return pool.query(queryString, [guest_id, limit]).then(res => {
    return res.rows;
  }).catch(e => console.log(e));


};
exports.getAllReservations = getAllReservations;

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */

const getAllProperties = function(options, limit = 10) {
  const queryParams = [];
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    queryParams.push(Number(options.owner_id));
    queryString += `AND owner_id = $${queryParams.length} `;
  }

  if (options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(Number(options.minimum_price_per_night) * 100);
    queryString += `AND cost_per_night >= $${queryParams.length} `;
    queryParams.push(Number(options.maximum_price_per_night) * 100);
    queryString += `AND cost_per_night <= $${queryParams.length} `;
  }

  if (options.minimum_rating) {
    queryParams.push(Number(options.minimum_rating));
    queryString += `AND rating >= $${queryParams.length} `;
  }

  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;
  return pool.query(queryString, queryParams).then((res) => res.rows).catch(e => console.log(e));
};
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {



};
exports.addProperty = addProperty;
