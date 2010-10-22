//
// Copyright (c) 2010 Marat Abrarov (abrarov@mail.ru)
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
//

#ifndef MA_NMEA_CYCLIC_READ_SESSION_FWD_HPP
#define MA_NMEA_CYCLIC_READ_SESSION_FWD_HPP

#include <boost/smart_ptr.hpp>

namespace ma
{
  namespace nmea
  {         
    class cyclic_read_session;
    typedef boost::shared_ptr<cyclic_read_session> cyclic_read_session_ptr;

  } // namespace nmea
} // namespace ma

#endif // MA_NMEA_CYCLIC_READ_SESSION_FWD_HPP