// Private Helper Functions

const expressAsyncHandler = require('express-async-handler')

/** ---------- Get All ---------- */
const getAll = (
  urlHandler,
  args,
  model,
  router,
  sort = ['id'],
  includes = []
) =>
  router.get(
    urlHandler,
    expressAsyncHandler(async (req, res) => {
      const collection = await model.findAll({
        where: {
          ...args,
        },
        order: sort,
        include: includes.map((include) => ({
          model: include,
        })),
      })

      res.json(collection)
    })
  )

module.exports = { getAll }
