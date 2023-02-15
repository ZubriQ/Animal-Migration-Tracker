﻿using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Olymp_Project.Controllers.Validators;
using Olymp_Project.Dtos.Location;
using System.Net;

namespace Olymp_Project.Controllers
{
    [Route("locations")]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private readonly ILocationService _service;
        private readonly IMapper _mapper;

        public LocationController(ILocationService service, IMapper mapper)
        {
            _service = service;
            _mapper = mapper;
        }

        [HttpGet("{pointId:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<ActionResult<LocationResponseDto>> GetLocation(long? pointId) // TODO: 401 unauthorized
        {
            if (!IdValidator.IsValid(pointId))
            {
                return BadRequest();
            }
            
            var location = await _service.GetLocationAsync(pointId.Value);
            if (location is null)
            {
                return NotFound();
            }
            return Ok(_mapper.Map<LocationResponseDto>(location));
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status409Conflict)]
        public async Task<ActionResult<LocationResponseDto>> AddLocation(LocationRequestDto location)
        {
            if (!LocationValidator.IsValid(location))
            {
                return BadRequest();
            }
            // TODO: 401 unauthorized;
            // invalid credentials.

            (HttpStatusCode status, Location? addedLocation) = 
                await _service.AddLocationAsync(_mapper.Map<Location>(location));

            if (status == HttpStatusCode.Conflict)
            {
                return Conflict();
            }
            var mappedLocation = _mapper.Map<LocationResponseDto>(addedLocation);
            return CreatedAtAction(nameof(AddLocation), mappedLocation);
        }

        [HttpPut("{pointId:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status409Conflict)]
        public async Task<ActionResult<LocationResponseDto>> UpdateLocation(
            long? pointId,
            LocationRequestDto location)
        {
            if (!IdValidator.IsValid(pointId) || !LocationValidator.IsValid(location))
            {
                return BadRequest();
            }
            // TODO: 401 unauthorized;
            // invalid credentials.

            (HttpStatusCode status, Location? updatedLocation) =
                await _service.UpdateLocationAsync((long)pointId, _mapper.Map<Location>(location));

            switch (status)
            {
                case HttpStatusCode.NotFound:
                    return NotFound();
                case HttpStatusCode.Conflict:
                    return Conflict();
            }
            return Ok(_mapper.Map<LocationResponseDto>(updatedLocation));
        }

        [HttpDelete("{pointId:long}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status401Unauthorized)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status409Conflict)]
        public async Task<IActionResult> DeleteLocation(long? pointId)
        {
            if (!IdValidator.IsValid(pointId))
            {
                return BadRequest();
            }
            // TODO: 401 unauthorized;
            // invalid credentials.

            var status = await _service.DeleteLocationAsync((long)pointId);
            switch (status)
            {
                case HttpStatusCode.NotFound:
                    return NotFound();
                case HttpStatusCode.BadRequest:
                    return BadRequest();
            }
            return Ok();
        }
    }
}
