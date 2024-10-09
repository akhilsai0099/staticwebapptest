module.exports = async function (context, req) {
  context.res.json({
    text: "this is a message from api",
  });
};
