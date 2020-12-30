const getDataFromImageName = (imageName) =>
  JSON.parse(
    imageName
      .replaceAll('-', '": ')
      .replaceAll('{', '{"')
      .replaceAll(',', ', "')
  )
module.exports = { getDataFromImageName }
