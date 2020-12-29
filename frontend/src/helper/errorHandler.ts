export const errHandler = (err: any, callback: (e: string) => void) => {
  console.log(err);
  const error = handleErr(err);
  if (Array.isArray(error)) error.forEach((_error) => callback(_error));
  else callback(error);
};

export const handleErr = (error: any) =>
  (error.response &&
    (error.response.data.errors ||
      error.response.data.message.replace("_", " "))) ||
  "An error occured";
