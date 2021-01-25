import React, { ReactElement } from 'react'
import Header from '../components/Header'
import { Container } from 'reactstrap'

const MainLayout = ({
  children,
  title,
  showMenu,
}: {
  children?: ReactElement
  title?: string
  showMenu?: boolean
}) => {
  return (
    <>
      <Header title={title} showMenu={showMenu} />
      <Container className='py-3'>{children}</Container>
    </>
  )
}

export default MainLayout
