import React from 'react';
import './style.scss';

const Section: (props: {
  className?: string;
  bgImage?: boolean;
  bgImageSrc?: string;
  width?: 'container' | 'container-fluid';
  styles?: { backgroundImage?: string };
  children?: any;
  id?: string;
}) => any = ({
  bgImage = false,
  bgImageSrc,
  className,
  styles = {},
  children,
  id,
  width = ''
}) => {
  bgImage && bgImageSrc
    ? (styles.backgroundImage = `url(${bgImageSrc})`)
    : console.log();
  return (
    <section
      id={id}
      className={`py-5 ${width} ${className +
        ' ' +
        (bgImage ? 'bg-image' : '')}`}
      style={{ ...styles }}
    >
      {children}
    </section>
  );
};

export default Section;
