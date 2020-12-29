export const getObject = (collection: any[], key: any) => {
  return collection.find((object: any) => object.id == key);
};

export const toPlural = (val: number, text: string) =>
  `${val} ${text}${(val > 1 && "s") || ""}`;
