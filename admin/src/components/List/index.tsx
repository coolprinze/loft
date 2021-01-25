import React from 'react';
import './style.scss';

const List: (prop: { items: string[]; textClass?: string }) => any = ({
  items,
  textClass = 'text-white'
}) => (
  <div className='custom-list mt-3'>
    {items.map((item, key) => (
      <li className='mb-3' key={key}>
        <span className={`mb-0 ${textClass}`}>{item}</span>
      </li>
    ))}
  </div>
);

export default List;
